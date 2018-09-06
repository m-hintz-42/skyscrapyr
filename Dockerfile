# TODO add python base image
FROM python:3.6

# Make working directory and pull the repo
RUN mkdir app && \
    cd app && \
    git clone https://github.com/m-hintz-42/skyscrapyr.git

# Install requirements
RUN cd app && \
    pip install -r requirements.txt

# Start scrapyrt server
RUN cd app/sckyscrapyr/coinmarketcap && \
    python -m scrapyrt -p 3000

## Start Flask server
#RUN cd app/sckyscrapyr && \
#    export FLASK_APP=skyscrapyr && \
#    python -m flask run -p 3001 --host=0.0.0.0