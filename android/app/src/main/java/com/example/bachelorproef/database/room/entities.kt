package com.example.bachelorproef.database.room

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
data class TestDatabaseEntity(
    @PrimaryKey val id: Int
    //other properties
)
