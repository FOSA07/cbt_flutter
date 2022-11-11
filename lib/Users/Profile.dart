import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orange[100],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('FOSA07',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('faletioluwaseyisam@gmail.com'),
                            SizedBox(width: 10,),
                            Icon(Icons.volunteer_activism, size: 14,color: Colors.orange,)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('Personal Info',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Language',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text('English')
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Payment Information',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Notification',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Switch(value: false, onChanged: null),
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('App Version',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('How we work',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Privacy and Policy',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Contact us',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.logout)),
                      const Text('Log out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
