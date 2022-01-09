from flask import Flask, render_template
import datetime
from werkzeug.utils import secure_filename
app = Flask(__name__)
app.config["C:\\Users\\rkhan\\Desktop\\Z Research Programming"]

@app.route("/")
def index():
    # Load current count
    f = open("count.txt", "r")
    count = int(f.read())
    f.close()

    # Increment the count
    count += 1

    # Overwrite the count
    f = open("count.txt", "w")
    f.write(str(count))
    f.close()


    current_date = datetime.datetime.now()
    g = open("current_date.txt", "w")
    g.write(str(current_date))
    g.close()

    # Render HTML with count variable
    return render_template("index.html", count=count, current_date=current_date)

@app.route('/index.html')
def returningToIndex():
    return render_template('index.html')

@app.route('/pca.html')
def pca():
    return render_template('pca.html')

@app.route('/settings.html')
def settings():
    return render_template('settings.html')

#@app.route('/upload.html')
#def upload():
#    return render_template('upload.html')

@app.route('/upload')
def upload_file():
   return render_template('upload.html')
	
@app.route('/uploader', methods = ['GET', 'POST'])
def upload_file():
   if request.method == 'POST':
      f = request.files['file']
      f.save(secure_filename(f.filename))
      return 'file uploaded successfully'

#pytho -m venv venv
#venv\Scripts\activate
#localhost:5000

if __name__ == "__main__":
    app.run()