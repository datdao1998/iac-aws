import json

# A simple AWS Lambda function that returns a greeting message.
def handler(event, context):
    name = event.get("name", "world")
    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({"message": f"Hello, {name}!"}),
    }
