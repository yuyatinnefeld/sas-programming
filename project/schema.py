import graphene
import requests
from crawl import extract



class Website(graphene.ObjectType):
    url = graphene.String(required=True)
    title = graphene.String()
    title_length = graphene.String()
    description = graphene.String()
    description_length = graphene.String()
    image = graphene.String()

class Query(graphene.ObjectType):
    website = graphene.Field(Website, url=graphene.String())

    def resolve_website(self, info, url):
        extracted = extract(url)
        return Website(url=url,
                       title=extracted.title,
                       title_length=len(extracted.title),
                       description=extracted.description,
                       description_length=len(extracted.description),
                       image=extracted.image)


schema = graphene.Schema(query=Query)