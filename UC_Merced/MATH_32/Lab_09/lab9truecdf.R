# set up a horizontal axis vector that goes from 1 to 5
pts = seq(from=1,to=5,by=0.01)

# this is the true CDF for the random variable Z = 0.5*(X + Y),
# assuming X and Y are independent RV's, each with a Pareto(3) PDF.
truecdf =  ((2*(-1 + pts)*pts*(15 + 2*pts*(-15 - 5*pts + 4*pts^3 + 16*pts^5)))/(1 - 2*pts)^2 - 15*log(-1 + 2*pts))/(16*pts^6)


