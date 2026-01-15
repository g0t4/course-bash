import turtle

t = turtle.Turtle()
screen = turtle.Screen()
root = screen._root
root.attributes("-topmost", True)

t.forward(100)
t.left(90)
t.forward(100)
t.right(45)
t.forward(200)
t.right(45)
t.forward(50)

screen.mainloop()

