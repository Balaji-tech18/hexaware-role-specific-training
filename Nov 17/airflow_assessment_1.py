cat > factory_batches.csv <<'EOF'
batch_id,units_produced,defective_units,value_per_unit
B501,100,2,350
B502,80,7,420
B503,120,4,300
B504,60,0,550
B505,90,6,400
EOF


import csv
from datetime import datetime

from airflow import DAG
from airflow.providers.standard.operators.python import PythonOperator


def load_batches():
    with open("/opt/airflow/dags/factory_batches.csv", newline="") as file:
        rows = list(csv.DictReader(file))

    print("Batches loaded:", len(rows))
    return rows


def check_quality(ti):
    batches = ti.xcom_pull(task_ids="load_batches")

    review_batches = []

    for batch in batches:
        units = int(batch["units_produced"])
        defective = int(batch["defective_units"])

        if defective / units > 0.05:
            review_batches.append(batch["batch_id"])

    return review_batches


def calculate_value(ti):
    batches = ti.xcom_pull(task_ids="load_batches")

    total_value = 0

    for batch in batches:
        units = int(batch["units_produced"])
        value = int(batch["value_per_unit"])

        total_value += units * value

    return total_value


def generate_report(ti):
    batches = ti.xcom_pull(task_ids="load_batches")
    review_batches = ti.xcom_pull(task_ids="check_quality")
    total_value = ti.xcom_pull(task_ids="calculate_value")

    print("MANUFACTURING QUALITY REPORT")
    print("Total batches:", len(batches))
    print("Batches requiring quality review:", review_batches)
    print("Total production value:", total_value)


with DAG(
    dag_id="factory_quality_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False
) as dag:

    task1 = PythonOperator(
        task_id="load_batches",
        python_callable=load_batches
    )

    task2 = PythonOperator(
        task_id="check_quality",
        python_callable=check_quality
    )

    task3 = PythonOperator(
        task_id="calculate_value",
        python_callable=calculate_value
    )

    task4 = PythonOperator(
        task_id="generate_report",
        python_callable=generate_report
    )

    task1 >> [task2, task3]
    [task2, task3] >> task4
EOF

python -m py_compile factory_quality_dag.py
