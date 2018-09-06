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
RUN cd app/skyscrapyr/coinmarketcap && \
    scrapyrt -p 3000

RUN echo "skyscrapyr is running at http://localhost:3000/crawl.json?start_requests=true&spider_name=coin"
## Start Flask server
#RUN cd app/sckyscrapyr && \
#    export FLASK_APP=skyscrapyr && \
#    python -m flask run -p 3001 --host=0.0.0.0