-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Orders] (
    [row_ID] int  NOT NULL ,
    [order_ID] varchar(10)  NOT NULL ,
    [order_Date] datetime  NOT NULL ,
    [customer_id] int  NOT NULL ,
    [item_id] int  NOT NULL ,
    [quantity] int  NOT NULL ,
    [delivered] boolean  NOT NULL ,
    [address_id] int  NOT NULL ,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED (
        [row_ID] ASC
    )
)

CREATE TABLE [Customers] (
    [cust_id] int  NOT NULL ,
    [cust_Fname] varchar(50)  NOT NULL ,
    [cust_Lname] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED (
        [cust_id] ASC
    )
)

CREATE TABLE [Address] (
    [address_id] int  NOT NULL ,
    [delivery_address1] varchar(200)  NOT NULL ,
    [delivery_address2] varchar(200)  NULL ,
    [delivery_city] varchar(50)  NOT NULL ,
    [delivery_zipcode] varchar(20)  NOT NULL ,
    CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED (
        [address_id] ASC
    )
)

CREATE TABLE [Item] (
    [item_id] int  NOT NULL ,
    [item_sku] varchar(30)  NOT NULL ,
    [Item_name] varchar(50)  NOT NULL ,
    [Item_category] varchar(50)  NOT NULL ,
    [Item_size] varchar(25)  NOT NULL ,
    [Item_price] decimal(5,2)  NOT NULL ,
    CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED (
        [item_id] ASC
    )
)

CREATE TABLE [Recipe] (
    [row_id] int  NOT NULL ,
    [recipe_id] varchar(30)  NOT NULL ,
    [ing_id] varchar(15)  NOT NULL ,
    [quantity] int  NOT NULL ,
    CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED (
        [row_id] ASC
    )
)

CREATE TABLE [Ingredients] (
    [ingredient_id] varchar(15)  NOT NULL ,
    [ingredient_name] varchar(25)  NOT NULL ,
    [ingredient_weight] int  NOT NULL ,
    [ingredient_measure] varchar(10)  NOT NULL ,
    [quantity] int  NOT NULL ,
    CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED (
        [ingredient_id] ASC
    )
)

CREATE TABLE [Stock] (
    [Stock_id] int  NOT NULL ,
    [Item_id] varchar(15)  NOT NULL ,
    [quantity] int  NOT NULL ,
    CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED (
        [Stock_id] ASC
    )
)

CREATE TABLE [Staff] (
    [staff_id] varchar(30)  NOT NULL ,
    [staff_Fname] varchar(30)  NOT NULL ,
    [staff_Lname] varchar(30)  NOT NULL ,
    [staff_position] varchar(30)  NOT NULL ,
    [hourly_rate] decimal(5,2)  NOT NULL ,
    CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED (
        [staff_id] ASC
    )
)

CREATE TABLE [Shift] (
    [shift_id] varchar(30)  NOT NULL ,
    [shift_day] varchar(15)  NOT NULL ,
    [shift_start] time  NOT NULL ,
    [shift_end] time  NOT NULL ,
    CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED (
        [shift_id] ASC
    )
)

CREATE TABLE [Rota] (
    [row_id] int  NOT NULL ,
    [rota_id] varchar(10)  NOT NULL ,
    [date] datetime  NOT NULL ,
    [shift_id] varchar(30)  NOT NULL ,
    [staff_id] varchar(30)  NOT NULL ,
    CONSTRAINT [PK_Rota] PRIMARY KEY CLUSTERED (
        [row_id] ASC
    )
)

ALTER TABLE [Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_cust_id] FOREIGN KEY([cust_id])
REFERENCES [Orders] ([customer_id])

ALTER TABLE [Customers] CHECK CONSTRAINT [FK_Customers_cust_id]

ALTER TABLE [Address] WITH CHECK ADD CONSTRAINT [FK_Address_address_id] FOREIGN KEY([address_id])
REFERENCES [Orders] ([address_id])

ALTER TABLE [Address] CHECK CONSTRAINT [FK_Address_address_id]

ALTER TABLE [Item] WITH CHECK ADD CONSTRAINT [FK_Item_item_id] FOREIGN KEY([item_id])
REFERENCES [Orders] ([item_id])

ALTER TABLE [Item] CHECK CONSTRAINT [FK_Item_item_id]

ALTER TABLE [Recipe] WITH CHECK ADD CONSTRAINT [FK_Recipe_recipe_id] FOREIGN KEY([recipe_id])
REFERENCES [Item] ([item_sku])

ALTER TABLE [Recipe] CHECK CONSTRAINT [FK_Recipe_recipe_id]

ALTER TABLE [Recipe] WITH CHECK ADD CONSTRAINT [FK_Recipe_ing_id] FOREIGN KEY([ing_id])
REFERENCES [Ingredients] ([ingredient_id])

ALTER TABLE [Recipe] CHECK CONSTRAINT [FK_Recipe_ing_id]

ALTER TABLE [Stock] WITH CHECK ADD CONSTRAINT [FK_Stock_Item_id] FOREIGN KEY([Item_id])
REFERENCES [Ingredients] ([ingredient_id])

ALTER TABLE [Stock] CHECK CONSTRAINT [FK_Stock_Item_id]

ALTER TABLE [Staff] WITH CHECK ADD CONSTRAINT [FK_Staff_staff_id] FOREIGN KEY([staff_id])
REFERENCES [Rota] ([staff_id])

ALTER TABLE [Staff] CHECK CONSTRAINT [FK_Staff_staff_id]

ALTER TABLE [Shift] WITH CHECK ADD CONSTRAINT [FK_Shift_shift_id] FOREIGN KEY([shift_id])
REFERENCES [Rota] ([shift_id])

ALTER TABLE [Shift] CHECK CONSTRAINT [FK_Shift_shift_id]

ALTER TABLE [Rota] WITH CHECK ADD CONSTRAINT [FK_Rota_date] FOREIGN KEY([date])
REFERENCES [Orders] ([order_Date])

ALTER TABLE [Rota] CHECK CONSTRAINT [FK_Rota_date]

COMMIT TRANSACTION QUICKDBD