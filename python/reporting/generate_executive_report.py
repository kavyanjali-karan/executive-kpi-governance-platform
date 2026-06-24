from datetime import datetime


def generate_report():

    report = {

        "generated_at": datetime.now(),

        "status": "success",

        "consumer": "Executive Leadership"

    }

    return report


if __name__ == "__main__":

    print(generate_report())