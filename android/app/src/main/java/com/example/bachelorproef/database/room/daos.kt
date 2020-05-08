package com.example.bachelorproef.database.room

import androidx.room.*

@Dao
interface TestEntityDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertEntity(entity: TestDatabaseEntity)

    @Query("SELECT * FROM TestDatabaseEntity")
    suspend fun getEntities(): List<TestDatabaseEntity>

    @Delete
    suspend fun deleteEntity(entity: TestDatabaseEntity)

    @Update
    suspend fun updateEntity(entity: TestDatabaseEntity)
}