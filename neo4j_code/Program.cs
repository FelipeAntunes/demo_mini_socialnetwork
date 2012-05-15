using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Neo4jRestNet.Core;

namespace neo4j_code
{
    class Program
    {
        public enum NodeProperty
        {
            Nome,
            Sobrenome
        }

        public enum NodeType
        {
            Usuario
        }


        public enum RelationshipType
        {
            amigo_de,
            casado_com,
        }

        static void Main(string[] args)
        {
        
           ArrayList nos = new ArrayList();      

           

            // Criando os nós

           for (int i = 0; i < 5; i++)
           {

               var propriedades = new Properties();
               propriedades.SetProperty(NodeProperty.Nome.ToString(), "Nome_" + i.ToString());
               propriedades.SetProperty(NodeProperty.Sobrenome.ToString(), "Sobrenome_" + i.ToString());
               var no = Node.CreateNode(NodeType.Usuario.ToString(), propriedades);
              
           }

            
            // Criando o relacionamento

           var no1 = nos[0];
           var no2 = nos[1];
           var no3 = nos[2];
           var no4 = nos[3];

            
            
            





        }
    }
}
