/*
  Warnings:

  - The primary key for the `Todos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Todos` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Todos` table. All the data in the column will be lost.
  - Added the required column `thing` to the `Todos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Todos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Todos" DROP CONSTRAINT "Todos_pkey",
DROP COLUMN "id",
DROP COLUMN "name",
ADD COLUMN     "thing" TEXT NOT NULL,
ADD COLUMN     "todo_id" SERIAL NOT NULL,
ADD COLUMN     "user_id" INTEGER NOT NULL,
ADD CONSTRAINT "Todos_pkey" PRIMARY KEY ("todo_id");

-- CreateTable
CREATE TABLE "User" (
    "user_id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("user_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- AddForeignKey
ALTER TABLE "Todos" ADD CONSTRAINT "Todos_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;
