
li t0, 10

count_loop:
      addi t0, t0, -1
      jal ra, my_func
      bgt t0, zero, count_loop

      

infinitive_loop:
      j infinitive_loop 


my_func:
      addi t1, t1, 10
      ret