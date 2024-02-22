FROM docker.io/python:3.12.2

COPY requirements.txt /requirements.txt
RUN pip install --no-cache --requirement /requirements.txt

ENTRYPOINT ["jupyter", "lab", "--allow-root", "--port=8080", "--ip='*'", "--NotebookApp.token=''", "--NotebookApp.password=''"]
