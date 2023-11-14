# Получение из файла всех идентификаторов систем

На входе ETL-процесса, есть txt-файл, полученный от системы хранения метаинформации.   
Система имеет свой формат выгрузки данных, которые изменить невозможно.  

grep с флагом -o, которое выводит совпадающие части строки,  
и регулярное выражение. Потом перенаправляю поток вывода к sed, который   
преобразовывает строку из вида "[ID: "Example"]" в "Example", то есть удаляет всё из строки,   
кроме самого идентификатора.  

### Пример данных файла
VSAM
SAP (Deprecated)
HTTP
        esb_conn1 - [ID: esb_conn1]
        test_connection_metr1 - [ID: test_connection_metr1]
        test_connection_metr - [ID: test_connection_metr]
        esb_conn - [ID: esb_conn]
DB2I
SQLSERVER
        FIFA_EDC_DW - [ID: FIFA_EDC_DW]
        DATASCIENCE - [ID: DATASCIENCE]
        DDB888_WAREHOUSE_METRIKA - [ID: DDB888_WAREHOUSE_METRIKA]
        DDB888_SRC_BERLIO_ODBC - [ID: DDB888_SRC_BERLIO_ODBC]
        Order_System - [ID: Order_System]
        SRC_BERLIO - [ID: SRC_BERLIO]
        DEMO_TIRT_SRC - [ID: DEMO_TIRT_SRC]
        DBB_02_Order_System - [ID: DBB_02_Order_System]
        OC_CD_KAZAHSTAN - [ID: OC_CD_KAZAHSTAN]
        DATA - [ID: DATA]
        DEMO_MC_SRC - [ID: DEMO_MC_SRC]
        WAREHOUSE_DEV4 - [ID: WAREHOUSE_DEV4]
        FIFA_BDM_DIS - [ID: FIFA_BDM_DIS]
...

Autumn 2023