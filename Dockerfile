FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV DATA_DIR=/app/data

RUN mkdir -p /app/data

# Проверка что установился именно aiogram 2.x
RUN python -c "from aiogram.contrib.fsm_storage.memory import MemoryStorage; print('aiogram 2.x OK')"

CMD ["python", "exchanger/app.py"]