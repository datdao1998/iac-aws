FROM public.ecr.aws/lambda/python:3.11

# your code
COPY app.py ${LAMBDA_TASK_ROOT}

# Lambda entrypoint (file.function)
CMD ["app.handler"]