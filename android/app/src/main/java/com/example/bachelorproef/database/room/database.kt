package com.example.bachelorproef.database.room

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase


@Database(entities = [TestDatabaseEntity::class],version = 1,exportSchema = false)
abstract class ApplicationDatabase : RoomDatabase() {

    /**
     * A companion object that holds the singleton database
     */
    companion object
    {
        /**
         * The internal instance of the database
         */
        private var instance: ApplicationDatabase? = null

        /**
         * Get the singleton database instance
         * @param context the context that is used to build the database
         * @return [ApplicationDatabase]
         */
        fun getInstance(context: Context): ApplicationDatabase
        {
            if(instance == null)
            {
                instance = Room.databaseBuilder(context,ApplicationDatabase::class.java, "Database").fallbackToDestructiveMigration().build()
            }
            //drop database if needed
            //dropDatabase(context)
            return instance!!
        }
    }

    abstract fun userDao(): TestEntityDao
}