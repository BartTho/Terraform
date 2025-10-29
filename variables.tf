variable "container_name_1" {
  default = "python-container-1"
}

variable "container_name_2" {
  default = "python-container-2"
}

variable "image" {
  default = "python:3.9-slim"
}

variable "script_content" {
  default = <<EOT
import time
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    result = "<br>".join(["DevOps is cool!" for _ in range(10)])
    return f"<h1>{result}</h1>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOT
}
