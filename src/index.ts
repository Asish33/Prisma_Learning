import {PrismaClient} from "@prisma/client"

const client = new PrismaClient();

async function main(){
await client.todos.create({
    data:{
        username: "Asish",
        name:"Asish",
        done:false
    }
})
}

main();
