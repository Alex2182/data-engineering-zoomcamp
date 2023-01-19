#Homework1 spent ~3 hours

Docker

```bash
echo "q1 answer: "
 3 docker build --help | grep '\--i' | grep 'id'
 4 echo "q2 answer: "
 5 docker run --rm python:3.9 pip list | grep "[0-9]*.[0-9]\$" | wc -l
```
