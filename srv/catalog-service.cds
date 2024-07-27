using { my.bookshop as my } from '../db/schema';


service CatalogService {
    entity Products as projection on my.Products;
    entity Orders as projection on my.Orders;
    entity Categories as projection on my.Categories;
    entity Customers as projection on my.Customers;
}