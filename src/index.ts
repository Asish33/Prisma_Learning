import { PrismaClient } from "@prisma/client";

const client = new PrismaClient();

async function main() {
  const user = await client.user.findFirst({
    where: {
      user_id: 1,
    },
    include:{
      todos:true
    }
  });
  console.log(user);
}

main();
