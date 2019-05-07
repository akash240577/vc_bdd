from behave import *

from features.Calculator import Calculator

use_step_matcher("parse")


@given("I entered {number1} into calculator")
def enter_number1(context, number1):
    """
    :type context: behave.runner.Context
    :type number1: str
    """
    context.number1 = number1


@step("I have also entered {number2} into calculator")
def step_impl(context, number2):
    """
    :type context: behave.runner.Context
    :type number2: str
    """
    context.number2 = number2


@when("I pressed add")
def press_add(context):
    """
    :type context: behave.runner.Context
    """
    calculator = Calculator(context.number1, context.number2)
    context.result = calculator.add()


@then("the sum should be {result}")
def check_result(context, result):
    """
    :type context: behave.runner.Context
    :type result: str
    """
    assert context.result == result
