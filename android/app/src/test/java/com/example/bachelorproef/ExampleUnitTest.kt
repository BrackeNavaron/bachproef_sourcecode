package com.example.bachelorproef

import org.junit.Test
import org.junit.Assert.*

class ExampleUnitTest {
    @Test
    fun addition_isCorrect() {
        //Arrange
        val c = Calculator()
        //Act
        val addedNumber = c.addNumbers(2,2)
        //Assert
        assertEquals(4, addedNumber)
    }
}

class Calculator {
    fun addNumbers(a: Int, b: Int): Int = a+b
}