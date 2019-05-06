from sklearn.base import BaseEstimator, ClassifierMixin
import numpy as np
import math


class SoftmaxClassifier(BaseEstimator, ClassifierMixin):  
    """A softmax classifier"""

    def __init__(self, lr = 0.01, alpha = 100, n_epochs = 1000, eps = 1.0e-5,threshold = 1.0e-10 , regularization = True, early_stopping = True):
       
        """
            self.lr : the learning rate for weights update during gradient descent
            self.alpha: the regularization coefficient 
            self.n_epochs: the number of iterations
            self.eps: the threshold to keep probabilities in range [self.eps;1.-self.eps]
            self.regularization: Enables the regularization, help to prevent overfitting
            self.threshold: Used for early stopping, if the difference between losses during 
                            two consecutive epochs is lower than self.threshold, then we stop the algorithm
            self.early_stopping: enables early stopping to prevent overfitting
        """

        self.lr = lr 
        self.alpha = alpha
        self.n_epochs = n_epochs
        self.eps = eps
        self.regularization = regularization
        self.threshold = threshold
        self.early_stopping = early_stopping
        self.nb_classes=0
     
        


    """
        Public methods, can be called by the user
        To create a custom estimator in sklearn, we need to define the following methods:
        * fit
        * predict
        * predict_proba
        * fit_predict        
        * score
    """


    """
        In:
        X : the set of examples of shape nb_example * self.nb_features
        y: the target classes of shape nb_example *  1

        Do:
        Initialize model parameters: self.theta_
        Create X_bias i.e. add a column of 1. to X , for the bias term
        For each epoch
            compute the probabilities
            compute the loss
            compute the gradient
            update the weights
            store the loss
        Test for early stopping

        Out:
        self, in sklearn the fit method returns the object itself


    """

    def fit(self, X, y=None):
        
        prev_loss = np.inf
        self.losses_ = []

        self.nb_feature = X.shape[1]
        self.nb_classes = len(np.unique(y))

        X_bias = np.c_[ np.ones(X.shape[0]), X]        
        self.theta_  = np.random.rand(X_bias.shape[1], self.nb_classes)
        
       
        for epoch in range( self.n_epochs):

            # logits = 
            probabilities = self.predict_proba(X, y)
       
            
            loss = self._cost_function(probabilities, y )               
            self.theta_ = self.theta_ - self.lr*self._get_gradient(X_bias, y, probabilities)
            
            self.losses_.append(loss)

#            if self.early_stopping:
#                if (len(self.losses_) > 0 ):
#                    diff = self.losses_[-1]-loss
#                    self.losses_.append(loss)
#                    if (abs(diff) < self.threshold):
#                        return self
#            else:
#                self.losses_.append(loss)
#            return self

    
    

    """
        In: 
        X without bias

        Do:
        Add bias term to X
        Compute the logits for X
        Compute the probabilities using softmax

        Out:
        Predicted probabilities
    """

    def predict_proba(self, X, y=None):
        try:
            getattr(self, "theta_")
        except AttributeError:
            raise RuntimeError("You must train classifer before predicting data!")
        
        X_bias = np.c_[ np.ones(X.shape[0]), X ]
        Z = X_bias @ self.theta_
        proba = np.apply_along_axis(self._softmax, 1, Z)
        
        return proba


        """
        In: 
        X without bias

        Do:
        Add bias term to X
        Compute the logits for X
        Compute the probabilities using softmax
        Predict the classes

        Out:
        Predicted classes
    """

    
    def predict(self, X, y=None):
        try:
            getattr(self, "theta_")
        except AttributeError:
            raise RuntimeError("You must train classifer before predicting data!")
        X_bias = np.c_[ np.ones(X.shape[0]), X ]
        Z = X_bias @ self.theta_
        probas = np.apply_along_axis(self._softmax, 1, Z)
        
        return np.argmax(probas, axis=1)
        

    

    def fit_predict(self, X, y=None):
        self.fit(X, y)
        return self.predict(X,y)


    """
        In : 
        X set of examples (without bias term)
        y the true labels

        Do:
            predict probabilities for X
            Compute the log loss without the regularization term

        Out:
        log loss between prediction and true labels

    """    

        
    def score(self, X, y=None):
        proba = self.predict_proba(X,y)
        reg_memo = self.regularization
        self.regularization = False
        loss = self._cost_function(proba, y)
        self.regularization = reg_memo        
        return loss
    
    

    """
        Private methods, their names begin with an underscore
    """

    """
        In :
        y without one hot encoding
        probabilities computed with softmax

        Do:
        One-hot encode y
        Ensure that probabilities are not equal to either 0. or 1. using self.eps
        Compute log_loss
        If self.regularization, compute l2 regularization term
        Ensure that probabilities are not equal to either 0. or 1. using self.eps

        Out:
        Probabilities
    """
    
    def _cost_function(self,probabilities, y ):   

        Y=self._one_hot(y)
        P_with_eps=probabilities + np.full((probabilities.shape[0], probabilities.shape[1]), self.eps, dtype=float)
        J_theta=0
        for i in range(Y.shape[0]):
            for j in range(Y.shape[1]):
                if probabilities[i][j]<self.eps:# la condition sur la probabilités en cas ou on a probabilité=0
                    J_theta= J_theta - (1/Y.shape[0])*Y[i][j]*math.log10(self.eps)
                elif probabilities[i][j]>1-self.eps: # la condition sur la probabilités en cas ou on a probabilité=1
                    J_theta= J_theta - (1/Y.shape[0])*Y[i][j]*math.log10(1-self.eps)
                else:
                    J_theta= J_theta - (1/Y.shape[0])*Y[i][j]*math.log10(P_with_eps[i][j])
        
        # Pour limiter l'overfitting d'ajouter un terme à la fonction de coût  J(Θ)
        if self.regularization == True :
            L2= 0   
            thetaLocal = self.theta_
            # On commence par m=1 parce qu'on ne régularise pas les poids associés à la colonne de biais de X. 
            for i in range(1, self.theta_.shape[0]):
                for j in range(self.theta_.shape[1]):
                    L2 = L2+ self.theta_[i][j]*self.theta_[i][j]
            L2 = self.alpha*L2  
            J_theta = J_theta + L2
        
        return J_theta
    
    """
        In :
        Target y: nb_examples * 1

        Do:
        One hot-encode y
        [1,1,2,3,1] --> [[1,0,0],
                         [1,0,0],
                         [0,1,0],
                         [0,0,1],
                         [1,0,0]]
        Out:
        y one-hot encoded
    """

    
    
    def _one_hot(self,y):
        
        nclasse = len(np.unique(y))

        #print("nbclasse", nclasse)
        one_hot_targets = np.eye(nclasse)[y]
        
        
        return one_hot_targets;
    """
        In :
        Logits: (self.nb_features +1) * self.nb_classes

        Do:
        Compute softmax on logits

        Out:
        Probabilities
    """
        
    
    def _softmax(self,z):  
            expZ = np.exp(z)
            return expZ / np.sum(expZ)
        
    

    """
        In:
        X with bias
        y without one hot encoding
        probabilities resulting of the softmax step

        Do:
        One-hot encode y
        Compute gradients
        If self.regularization add l2 regularization term

        Out:
        Gradient

    """

    def _get_gradient(self,X,y, probas):
        
        
        Y=self._one_hot(y)
        P_with_eps=np.zeros((Y.shape[0], Y.shape[1]))
        
        for i in range(Y.shape[0]):
            for j in range(Y.shape[1]):
                if probas[i][j]<self.eps:
                    P_with_eps[i][j]=self.eps 
                elif probas[i][j]>1-self.eps:
                    P_with_eps[i][j]=1-self.eps
                else:
                    P_with_eps[i][j]=probas[i][j]
   
        Delta_J=(1/(Y.shape[0]))*np.transpose(X)@(P_with_eps-Y)
        
        # On ajoute la dérivé de L2 au terme gradient
        if self.regularization == True:
            for i in range(Y.shape[0]):
                for j in range(Y.shape[1]):
                    if probas[i][j]<self.eps:
                        P_with_eps[i][j]=self.eps 
                    elif probas[i][j]>1-self.eps:
                        P_with_eps[i][j]=1-self.eps
                    else:
                        P_with_eps[i][j]=probas[i][j]
        dL2 = self.alpha*(1/(Y.shape[0]))*self.theta_
        # On ne veut pas régualrizer les poids de biais
        dL2[0,:] = 0
        Delta_J=(1/(Y.shape[0]))*np.transpose(X)@(P_with_eps-Y)+ dL2
            
        return Delta_J
        
        
        
    
    