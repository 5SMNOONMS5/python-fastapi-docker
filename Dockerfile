FROM tiangolo/uvicorn-gunicorn-fastapi:latest

# Install poetry and configure it for running inside of the Docker container.
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Copy using poetry.lock* in case it doesn't exist yet
# Because it uses ./app/poetry.lock* (ending with a *),
# it won't crash if that file is not available yet.
COPY ./app/pyproject.toml ./app/poetry.lock* /app/

# Add pylint
RUN pip install pylint

# Install the dependencies.
RUN poetry install --no-root --no-dev

# Then copy your app code
COPY ./app /app