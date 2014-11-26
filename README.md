WebService-Rails
=========
This web service is for serving customers data and the data of the company. Customers can browse the products of the company and receive e-mails when new products is launched. The staff of this company can scan the Barcode or QRcode to add products to the database.

You can find the client app for this web service [here](https://github.com/chichunchen/QRcode_Android).

Version: 
-----------
    ruby version 2.0.0  
    rails version 4.0.3

### Auto clear tmp, log, db:drop, db:create, db:migrate

	rake dev:build

### Automatically build and then db:seed
	
	rake dev:rebuilt

