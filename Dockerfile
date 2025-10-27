# Используем минимальный образ Python 3.11
FROM python:3.11-slim

# Оптимизация: не писать pyc и выводить все сразу
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем зависимости и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Копируем весь проект в контейнер
COPY . .

# Открываем порт, если нужен (FastAPI, например)
EXPOSE 8000

# По умолчанию запускаем server.py
CMD ["python", "-m", "ncbi_mcp_server.server"]
