from flask import Flask, render_template, json

app = Flask(__name__)

@app.route('/')
def index():
    with open('treino_mandarim.json', 'r', encoding='utf-8') as f:
        caracteres = json.load(f)
    return render_template('index.html', caracteres=caracteres)

@app.route('/quiz')
def quiz():
    with open('treino_mandarim.json', 'r', encoding='utf-8') as f:
        caracteres = json.load(f)
    return render_template('quiz.html', caracteres=caracteres)

if __name__ == '__main__':
    app.run(debug=True)
