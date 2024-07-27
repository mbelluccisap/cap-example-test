namespace my.bookshop;

entity Products {
    key ID   : UUID;
    name     : String(111);
    description : String(255);
    price    : Decimal(10, 2);
    stock    : Integer;
    category : Association to Categories;
    @readonly rating : Decimal(2, 1);
    createdAt : DateTime;
    modifiedAt : DateTime;
}

entity Orders {
    key ID       : UUID;
    productID    : Association to Products;
    quantity     : Integer;
    status       : String(20);
    totalPrice   : Decimal(10, 2);
    orderDate    : DateTime;
    customer     : Association to Customers;
}

entity Categories {
    key ID   : UUID;
    name     : String(111);
    description : String(255);
    @readonly numberOfProducts : Integer;
}

entity Customers {
    key ID       : UUID;
    firstName    : String(50);
    lastName     : String(50);
    email        : String(100);
    phoneNumber  : String(15);
    createdAt    : DateTime;
    modifiedAt   : DateTime;
    orders       : Composition of many Orders on orders.customer = $self;
}
