# -*- coding: utf-8 -*-
"""
Created on Sun May 11 21:54:39 2025

@author: Miriam
"""

"""

Valoración de una opción vainilla europea de compra con dividendos continuos.

"""

import QuantLib as ql

#–– Datos de la opción
S0     = ql.SimpleQuote(127.62)       # Precio del activo en fecha de valor
strike = 130.0                        # Precio de ejercicio K
r      = ql.SimpleQuote(0.001)        # Tipo interés r = 0.1%
q      = ql.SimpleQuote(0.0163)       # Tasa de dividendos q = 1.63%
sigma  = ql.SimpleQuote(0.20)         # Volatilidad del activo = 20%
today  = ql.Date(25, 4, 2025)         # Fecha actual
maturity = ql.Date(25, 1, 2026)       # Fecha de vencimiento

# Establecemos la fecha de valoración
ql.Settings.instance().evaluationDate = today

#–– Calendario y day-count
calendar   = ql.UnitedStates(ql.UnitedStates.NYSE)
day_counter = ql.Actual365Fixed()

# Generamos la curva de tipo de interés y las volatilidades
riskfreecurve = ql.FlatForward(
    today,
    ql.QuoteHandle(r),
    day_counter,
    ql.Compounded,
    ql.Annual
)
q_curve = ql.FlatForward(
    today,
    ql.QuoteHandle(q),
    day_counter,
    ql.Compounded,
    ql.Annual
)

# Superficie de volatilidad constante
volatility = ql.BlackConstantVol(
    today,
    calendar,
    ql.QuoteHandle(sigma),
    day_counter
)

# Definimos el proceso estocástico que gobierna la evolución del precio del activo
process = ql. GeneralizedBlackScholesProcess(
    ql.QuoteHandle(S0),
    ql.YieldTermStructureHandle(q_curve),
    ql.YieldTermStructureHandle(riskfreecurve),
    ql.BlackVolTermStructureHandle(volatility)
)

# Opción europea de compra
payoff   = ql.PlainVanillaPayoff(ql.Option.Call, strike)
exercise = ql.EuropeanExercise(maturity)
option   = ql.VanillaOption(payoff, exercise)

# Diferencias finitas
engine_df = ql.FdBlackScholesVanillaEngine(process, 800, 800)
option.setPricingEngine(engine_df)
price_df = option.NPV()

# Monte Carlo
engine_mc = ql.MCEuropeanEngine(
    process,
    "pseudorandom",
    antitheticVariate=True,
    timeSteps=50,
    requiredSamples=100000
)
option.setPricingEngine(engine_mc)
price_mc  = option.NPV()
error_mc  = option.errorEstimate()

# Fórmula analítica de Black–Scholes
engine_bs = ql.AnalyticEuropeanEngine(process)
option.setPricingEngine(engine_bs)
price_bs  = option.NPV()

#–– Resultados
print('--Valoración de una opción vainilla europea de compra con dividendos continuos--\n')

print('Precio de la opcion europea de compra por Diferenciass Finitas: %.6f' %price_df)
print('Precio opción europea compra por Monte Carlo: %.6f' %price_mc)
print('Error cometido con el método de Monte Carlo: %.6f' %error_mc)
print('Precio opción europea compra por fórmula Black Scholes: %.6f' %price_bs)

