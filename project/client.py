import requests

q = """
{
  website(url: "https://wanamour.de") {
    title
    image
    description
  }
}
"""

resp = requests.post("http://localhost:5000/", params={'query': q})
print(resp.text)