from flask import Flask, render_template
import datetime
app = Flask(__name__)

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

#pytho -m venv venv
#venv\Scripts\activate
#localhost:5000

if __name__ == "__main__":
    app.run()