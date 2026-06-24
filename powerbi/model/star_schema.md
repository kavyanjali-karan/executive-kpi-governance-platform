# Star Schema

                    dim_date

                       |

dim_customer ---- fact_customer_activity ---- dim_product

                       |

                  dim_channel

                       |

                  dim_region

---

Fact Table

fact_customer_activity

Grain

One row per customer per reporting date.

---

Dimensions

dim_customer

dim_product

dim_channel

dim_region

dim_date