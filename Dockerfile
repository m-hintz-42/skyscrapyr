# TODO add python base image
FROM python:3.6

# Make working directory and pull the repo
RUN mkdir app && \
    cd app && \
    git clone https://github.com/m-hintz-42/skyscrapyr.git

# Install requirements
RUN cd app/skyscrapyr && \
    pip install -r requirements.txt

# Start scrapyrt server
CMD cd app/skyscrapyr/coinmarketcap && \
    scrapyrt -i 0.0.0.0 -p 3000

EXPOSE 3000

RUN echo -e "skyscrapyr is running at \033[92mhttp://localhost:3000/crawl.json?start_requests=true&spider_name=coin\033[0m"
## Start Flask server
#RUN cd app/sckyscrapyr && \
#    export FLASK_APP=skyscrapyr && \
#    python -m flask run -p 3001 --host=0.0.0.0