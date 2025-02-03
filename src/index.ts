import { PrismaClient } from "@prisma/client";

const client = new PrismaClient();

async function main() {
  const user = await client.todos.findFirst({
    where: {
      username: "Asish",
    },
  });
  console.log(user);
}

main();
