def countdown(n):
    print('Counting down!')
    while n > 0:
        yield n
        n -= 1


c = countdown(5)
c.next()
