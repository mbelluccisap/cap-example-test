# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

## Tasks

### Task 1: Adding Annotations and Enhancing the UI

**Enhance the UI**:
- Navigate to annotation file named `annotations.cds` in the `db` directory.
- Add annotations to the `Products` entity to provide metadata for UI enhancements.
- Use annotations to define the following:
  - Add createdAt,modifiedAt as default columns in the Fiori Elements. 
  - Enhance the critically of the STOCK. If it is less than 50 raise critically to 1, otherwise 3.
  - Sort the products by name in `descending` order.   


### Task 2: Implementing Asynchronous Operations
In this task, you will modify the existing service to perform asynchronous operations. Specifically, you will fetch additional data from an external API when creating an order.

Specific Requirement:
1. Modify the `srv/catalog-service.js` File:
 - Implement an asynchronous operation to fetch data from https://jsonplaceholder.typicode.com/todos/1 when an order is created.
 - Use the fetched data to update the order's status.
 - Locate the CREATE operation for the Orders entity.
 - Add an asynchronous call to fetch data from the external API.
 - Update the order's status using the fetched data, if 'copmleted' is true then update Status to 'Shipped' other wise 'Pending'
 - use the `test/requests.http` to test the functionality
 - Use the Following API:
 https://jsonplaceholder.typicode.com/todos/1
The API returns:

```json
{
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
```

## Task 3: Implementing a Node.js Callback
Modify the `srv/catalog-service.cds` File:
 - Create a new action called `fetchProducts` that accepts data as a String.
Modify the `srv/catalog-service.js` File:
 - Implement the `fetchProducts` action.
 - Use a Node.js callback to read products with CDS with a price less than $20
 - log result
