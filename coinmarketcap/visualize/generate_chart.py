import plotly.offline as py
import plotly.graph_objs as go
import json


def get_json_data(json_file_path):
    with open(json_file_path) as f:
        data = json.load(f)
        return data


def generate_chart(data):
    size = [float(data[index]['price']) for index, x in enumerate(data) if data[index]['price'] != '?']
    market_cap = [float(data[index]['market_cap'].replace('\n', '').replace('$', '').replace(',', ''))
                  for index, x in enumerate(data) if '?' not in data[index]['market_cap']]
    trace0 = go.Scatter(
        x=market_cap,
        y=size,
        mode='markers',
        marker=dict(
            size=market_cap,
            sizemode='area',
            sizeref=2. * max(market_cap, key=float) / (80. ** 2),
            sizemin=2
        )
    )
    data = [trace0]
    layout = go.Layout(
        xaxis=dict(
            type='log',
            autorange=True
        ),
        yaxis=dict(
            type='log',
            autorange=True
        )
    )
    fig = go.Figure(data=data, layout=layout)
    py.plot(fig, filename='coin_market_cap.html')


a = get_json_data('../coin.json')
generate_chart(a)



