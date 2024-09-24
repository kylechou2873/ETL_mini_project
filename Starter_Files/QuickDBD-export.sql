-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" VARCHAR(50)   NOT NULL,
    "description" VARCHAR(200)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" VARCHAR(20)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" VARCHAR(5)   NOT NULL,
    "currency" VARCHAR(5)   NOT NULL,
    "launch_date" VARCHAR(30)   NOT NULL,
    "end_date" VARCHAR(30)   NOT NULL,
    "category_ids" VARCHAR(5)   NOT NULL,
    "subcategory_ids" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "category" (
    "category_ids" VARCHAR(5)   NOT NULL,
    "category" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_ids"
     ),
    CONSTRAINT "uc_category_category" UNIQUE (
        "category"
    )
);

CREATE TABLE "subcategory" (
    "subcategory_ids" VARCHAR(10)   NOT NULL,
    "subcategory" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_ids"
     ),
    CONSTRAINT "uc_subcategory_subcategory" UNIQUE (
        "subcategory"
    )
);

CREATE TABLE "contact" (
    "contact_id" int   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "email" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_contact" PRIMARY KEY (
        "contact_id"
     ),
    CONSTRAINT "uc_contact_email" UNIQUE (
        "email"
    )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contact" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_ids" FOREIGN KEY("category_ids")
REFERENCES "category" ("category_ids");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_ids" FOREIGN KEY("subcategory_ids")
REFERENCES "subcategory" ("subcategory_ids");

--SELECT STATMENTS
SELECT * 
FROM campaign;

SELECT * 
FROM contact;

SELECT * 
FROM category;

SELECT *
FROM subcategory;