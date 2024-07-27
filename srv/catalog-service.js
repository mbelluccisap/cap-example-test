const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { Orders, Products, Categories, Customers } = this.entities;

    // Automatically set createdAt and modifiedAt timestamps
    this.before('CREATE', ['Products', 'Customers'], async (req) => {
        const now = new Date();
        req.data.createdAt = now;
        req.data.modifiedAt = now;
    });

    this.before('UPDATE', ['Products', 'Customers'], async (req) => {
        req.data.modifiedAt = new Date();
    });

    // Calculate total price
    this.before('CREATE', 'Orders', async (req) => {
        const product = await SELECT.one.from(Products).where({ ID: req.data.productID });
        if (!product) {
            req.error(404, `Product not found`);
        }

        req.data.totalPrice = product.price * req.data.quantity;
        req.data.orderDate = new Date();
    });

    this.after('CREATE', 'Orders', async (data, req) => {
        // Log creation of the order
        console.log(`Order ${data.ID} created successfully.`);
    });
});
