# -*- coding: utf-8 -*-

import QuantLib as ql

#Precio opción si el activo paga dividendos continuos
S0=ql.SimpleQuote(17)
strike=15
r=ql.SimpleQuote(0.03)
sigma=ql.SimpleQuote(0.25)
q=ql.SimpleQuote(0.015)
today=ql.Date(25,4,2025)
maturity=today+ql.Period(3,ql.Months)
#Establecemos la fecha de valoración
ql.Settings.instance().evaluationDate=today
#Opción de compra
#creamos la opción a partir del payoff y el tipo de ejercicio
option=ql.VanillaOption(ql.PlainVanillaPayoff(ql.Option.Call,strike),
                         ql.EuropeanExercise(maturity))
#generamos la curva de tipos de interés, dividendos y las volatilidades
riskfreecurve=ql.FlatForward(today,ql.QuoteHandle(r),ql.ActualActual(ql.ActualActual.ISDA))
volatility=ql.BlackConstantVol(today,ql.TARGET(),ql.QuoteHandle(sigma),ql.ActualActual(ql.ActualActual.ISDA))
q_curve=ql.FlatForward(today,ql.QuoteHandle(q),ql.ActualActual(ql.ActualActual.ISDA))
#definimos el proceso estocástico que gobierna la evolución del precio del activo
process=ql.GeneralizedBlackScholesProcess(ql.QuoteHandle(S0),ql.YieldTermStructureHandle(q_curve),
ql.YieldTermStructureHandle(riskfreecurve),ql.BlackVolTermStructureHandle(volatility))
#elegimos el método de valoración, en este caso diferencias finitas
#timeSteps y gridPoints por defecto son iguales a 100
engine=ql.FdBlackScholesVanillaEngine(process,800,800) 
#establecemos el método elegido como motor de valoración
option.setPricingEngine(engine)
#Calculamos el precio de la opción
print('Precio opción europea compra FD',option.NPV())
print('¿Ha expirado la opción?',option.isExpired())

engine=ql.MCEuropeanEngine(process,'pseudorandom',antitheticVariate=True,timeSteps=50,requiredSamples=100000) 
option.setPricingEngine(engine)
print('Precio opción europea compra Monte Carlo',option.NPV())
print('Error cometido con el método de Monte Carlo',option.errorEstimate())

engine=ql.AnalyticEuropeanEngine(process) 
option.setPricingEngine(engine)
print('Precio opción europea compra fórmula Black-Scholes',option.NPV())
#Cálculo de griegas
print('Cálculo de las griegas')
print(option.delta())
print(option.gamma())
print(option.theta())
print(option.vega())
print(option.rho())