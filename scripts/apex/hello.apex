Invoice i = new Invoice();
i.DueDate = Date.today() + 20;
i.InvoiceDate = Date.today();
i.Description = 'Sample invoice';
//i.InvoiceNumber = '123456';
i.ReferenceEntityId = '8015g000000nd5WAAQ';
insert (i);