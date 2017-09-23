x,y,z=var("x y z");
A=matrix([[x,z],[z,y]]);
show(A);

p1=A.trace();
p2=A.determinant();

@interact
def _(T=input_box(3,label="Fix a trace T"),
      D=input_box(-1,label="Fix a determinant D"),
      r=input_box(5,label="Pick a range r"),
      t1=text_control("The blue plane is trace=x+y=T for the given T."),
      t2=text_control("The red surface is determinant=xy-z^2=D for the given D."),
      t3=text_control("The region is -r <= x,y,z <= r."),
      t4=text_control("The intersection of blue and red is the isospectral manifold \
      with characteristic polynomial u^2 - T u + D = 0."),
      t5=text_control("Try different T and D by changing the value and press enter; \
      also, you can rotate the graph."),
     ):
    M1=implicit_plot3d(p1-T,(x,-r,r),(y,-r,r),(z,-r,r));
    M2=implicit_plot3d(p2-D,(x,-r,r),(y,-r,r),(z,-r,r),color="red");
    show(M1+M2,viewer="threejs",axes=True);