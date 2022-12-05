import uvicorn
from fastapi import FastAPI

from mylib import logic


app = FastAPI()


@app.get("/")
def root():
    return {"message": "Wikipedia API: use /search or /wiki"}


@app.get("/search/{value}")
def search(value: str):
    """Page to search in Wikipedia"""
    result = logic.search_wiki(value)
    return {"result": result}


@app.get("/wiki/{name}")
def wiki(name: str):
    """Retrieve Wikipedia page"""
    result = logic.wiki(name)
    return {"result": result}


@app.get("/phrase/{name}")
def phrase(name: str):
    """Retrieve Wikipedia page and return phrases"""
    result = logic.phrases(name)
    return {"result": result}


if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
