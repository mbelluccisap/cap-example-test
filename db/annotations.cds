using {my.bookshop as my} from '../db/schema';

annotate my.Products with @(
    UI.HeaderInfo: {
        TypeName      : 'Product',
        TypeNamePlural: 'Products',
        $Type         : 'UI.HeaderInfoType',
    },
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Label: 'Product Name',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description
        },
        {
            $Type: 'UI.DataField',
            Label: 'Price',
            Value: price,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Stock',
            Value: stock,
            // Criticality: 
        },
        {
            $Type: 'UI.DataField',
            Label: 'Category',
            Value: category.name
        },
        {
            $Type: 'UI.DataField',
            Label: 'Rating',
            Value: rating,
        }
    ],
    UI.PresentationVariant: {
        Visualizations: ['@UI.LineItem'],
        // SortOrder:
    }
);
