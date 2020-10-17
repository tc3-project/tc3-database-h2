# The Caribbean Coffee Company ![](./.common/logo.png?raw=true)
by Joel Mussman<br/>
original project concept by Joel Mussman and Justin Poole 

The Caribbean Coffee Company (TC3) is a cafe-operations project that was developed as the basis for demonstrations
and classwork for almost every software development technology that you can work with, from databases through devices.
All participants can identify with the cafe scenario and have a feel for how it must work.
The core environment is kept simple: products, employees, and customers.
<br>
<br>

# TC3-Database-H2

## History

2019-10-13 - Original release.<br>
2020-10-17 - Simplified the database, the original real-world schema was far too complicated for examples.

## Overview

There are two versions of the H2 database included, and two SQL scripts.
The *tc3-h2-core.mv.db* file contains just the schema with employee types populated, built from the *tc3-h2-schema.sql* script.

*tc3-h2-sample-data.mv.db* has 25 employees, 100 customers, 35 products, and 300 sales orders, 
added by running the *tc3-h2-sample-data.sql* script after creating the tables from *tc3-sqlite3-schema.sql*.

To level-set, this is a fundamental database implementation with customers, employees, and products
that is intended to be used as a basis for writing server-side and client-side applications.
The tables are basic,
the purpose is to use this database in teaching environments where participants should not be overwhelmed with
field after field of unnecessary data.
The fundamental concepts are all here to work with: multiple related tables, natural vs surrogate primary keys,
foreign key relationships, null vs zero, stored vs calculated data, etc.
It is not a perfect design, on purpose to teach with.

Customers and employees do not have addresses, telephone numbers, or any extra data like that to
keep it simple.
Sales orders have stored totals to contrast stored vs calculated results.
Customer passwords are random and in clear text, recorded credit card numbers for transactions
are in clear text.
Issues like these offer opportunities to introduce and develop security concepts for databases and
application programs. There is a line commented out in the tc3-sample-data.sql script that will mask the
credit card numbers if you want to start out with them masked.

Associative tables are an advanced topic in regards to creating classes in object-relational frameworks such as
*Hibernate* and *Microsoft Entity Framework*.
Because of that this database design purposely does not include any associative tables. 
In case you need an associative table for more advanced application work, mapping customers to products
they have bought produces a good example.
The code to create the table and populate may be found in the *tc3-h2-sample-data.sql* file.


## Project Setup

Start with a copy of the *tc3-h2-core.mv.db* file or *tc3-h2-sample-data.mv.db* file in your application, feel free to change the name.
Or, use the schema and sample SQL files to populate a database at runtime, e.g. in a Spring boot test environment.

## Related Projects

Of course every project in https://github.com/tc3-project is related in some manner,
but you may want to take a closer look at
https://github.com/tc3-project/tc3-product-images.
There you will find images for the products to use in applications, and scripts to add the images
to the SQLite3 database as blobs an application may query.

## License

This project code is licensed under the [MIT license](./.common/LICENSE.md).

This database schema and sample data (partially created at https://mockaroo.com) are distributed freely.
If you want to use them for demonstrations or as the basis of your own labs, feel free.
I consider it to be a compliment and an honor that you want to use my sources, and I would much rather be
a collaborator than a competitor!
Feel free to contact me, and if you would, please give me credit when you use this.

## Project Details

This is part of of the larger Caribbean Coffee Company suite of components using different technologies and programming languages that fit into the TC3 project.
Learn more at [https://gitlab.com/tc3-project](https://gitlab.com/tc3-project).

## Support

If you found this project helpful, and and you would like to see more free projects like this,
then please consider
a contribution to *Joel's Coffee Fund* at **Smallrock Internet** to help keep the good stuff coming :)<br />

[![Donate](./.common/Donate-Paypal.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=XPUGVGZZ8RUAA)

<hr>
Copyright © 2019-2020 Joel A Mussman. All rights reserved.