In 'code/GBM and its portfolio/Schemes for SDE(GBM)/' folder

Run function \textbf{'eular.m'}, \textbf{'MilsteinApprox.m'}, \textbf{'analyticalApprox.m'} to add them to the path of MATLAB compiler.

Then run the \textbf{'eularmain.m'}, you get one path of GBM driven by  weak-Euler scheme. Run \textbf{'Milsteinmain.m'}, you get one path of GBM driven by Milstein scheme. Run \textbf{'analyticalApprox.m'}, you directly get one path of GBM.


In 'code/GBM and its portfolio/option and delta by Merton/' folder, Run function \textbf{'weak-Euler.m'} to add it to path of MATLAB.

Then run \textbf{'eucall.m'}, you get the value of European call option, European put option and Asset-or-nothing call option. In the workspace, \textbf{call} is European call option, \textbf{put} is European put option and \textbf{assetno} is Asset-or-nothing call option. They are all come from Merton's formula.

Close the picture but do not clear the workspace, run the \textbf{'portfolioforGBM.m'} you will see the portfolio, European-call-option by Merton and European-call-option by Monte-carlo where we set M=10000 in Monte-carlo.

Close the picture but do not clear the workspace, run the \textbf{'portfolioforGBM2.m'} you will see the portfolio, Asset-or-nothing call option by Merton and Asset-or-nothing call option where we set M=10000 in Monte-carlo.

In workspace, \textbf{delta} is delta of European-call-option, \textbf{deltaasset} is delta of Asset-or-nothing call option. \textbf{portfoli} is the portfolio value of the corresponding option.

In 'code/GBM and its portfolio/option and delta by Montecarlo/' folder

Firstly, you can change the value of dt. We initially set dt=0.005, Run the \textbf{'deltamonte.m'}, you get $\hat{u}(0,X_0)$ and $\hat{\partial u}(0,X_0)$ of European call option. In workspave, callmonte is the option price at t=0, lenu is its confidence interval. delta0 is the delta at t=0 and lendelta is its confidence interval.

Run the \textbf{'assetdelta.m'}, you get $\hat{u}(0,X_0)$ and $\hat{\partial u}(0,X_0)$ of Asset-or-nothing call option. In workspave, callmonte is the option price at t=0, lenu is its confidence interval. delta0 is the delta at t=0 and lendelta is its confidence interval. Similarly, you can change the value of dt.

In 'code/GBM and its portfolio/option and delta by Montecarlo/ covergence of Weak schemes/Task4.rmd' 
We use R to do this part. There 7 chunks in file Task4.rmd.

The first chunk is to approximate price of European option at time 0. Run the first chunk and you will get two number, first number is the simulating price and the second is the exact price. (You can choose to use function 'St\_GMB'(analytical solution) or function 'St\_weakEuler' (weak-Euler scheme by signing one of the statements with '#' and using the other. So as the following chunks).
The second chunk is to plot the convergence rate of weak-Euler scheme. Run it and you will get the graph.

The third chunk is to  plot the convergence rate of Monte-Carlo for European option. Run it and you will get the graph.

The fourth chunk is to approximate delta of European option and plot the convergence.

The fifth chunk is to approximate the price of asset-or-nothing call option.

The sixth chunk is to plot convergence rate for asset-or-nothing call option by Monte-Carlo.

The last chunk is to approximate delta of asset-or-nothing call option and plot the convergence.
