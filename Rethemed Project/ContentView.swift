//
//  ContentView.swift
//  TriviaGame
//
//  Created by Jack Hyde on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    
    // STATE VARIBLES
    @State var message = "Click the START GAME button to begin"
    
    // State variables used to display options/answers for user to select
    @State var Q1 = ""
    @State var Q2 = ""
    @State var Q3 = ""
    @State var Q4 = ""
    
    @State var buttonText = "START GAME"
    
    // State value used to determine which question to display
    @State var qIndex = -1
    
    // State value used to keep track of user's score
    @State var score = 0
    
    let questions = [
        "What is your Name?",
        "What is your favorite color?",
        "What is the airspeed velocity of an unladen swallow?"
    ]
    
//    let answers = [
//        "Led Zepplin",
//        "Pink Floyd",
//        "Van Halen",
//        "Queen"
//    ]
   
    let answers = [
        [
            ["My Name... duh", "Correct"],
            ["Edward", "Wrong, No way thats your real name."],
            ["Eustace", "Wrong, go back to the middle of nowhere 'Eustace'"],
            ["Archibald", "Sorry, we don't allow british royalty here..."]
        ],
        [
            ["Red", "Wrong"],
            ["Green", "Wrong"],
            ["Blue", "Correct"],
            ["Some other dumb color", "Wrong"]
        ],
        [
            ["27 MPH", "Wrong"],
            ["24 MPH", "Correct"],
            ["18 MPH", "Wrong"],
            ["European or African?", "HUH!?"]
        ]
    ]
    
    func hideOptions(){
        Q1 = ""
        Q2 = ""
        Q3 = ""
        Q4 = ""
    }

    func nextQuestion(){
        if (qIndex < questions.count - 1){
            qIndex += 1
            message = questions[qIndex]
            Q1 = answers[qIndex][0][0]
            Q2 = answers[qIndex][1][0]
            Q3 = answers[qIndex][2][0]
            Q4 = answers[qIndex][3][0]
            buttonText = "NEXT QUESTION"
        } else {
            // Displays final score to user
            message = "Game Over. You got " + String(score) + " correct."
            buttonText = "Restart?"
            hideOptions()
            
            if (qIndex > questions.count - 1){
                let qIndex = -1
                let score = score - score
            }
        }
        
        
    }
    
    func restart(){
        if (qIndex > 3){
            let qIndex = 0
            let score = score - score
        }
    }
    
    // Function used to check if user's guess is correct or not. The "a" parameter is used to determine which option was selected.
    // Also, the function adds a point to the user's score for each correct answer
    func checkAnswer(a: Int){
        if (answers[qIndex][a][1] == "Correct"){
            message = "CORRECT!!!"
            score += 1
        } else if (answers[qIndex][a][1] == "HUH!?"){ message = "The troll is flung off the bridge!"
            score += 1
        }
            
        else {
            message = "Sorry wrong answer"
        }
        
        hideOptions()
    }
    
    var body: some View {
        ZStack{

            Color.red.ignoresSafeArea()

            VStack {
                Spacer()
                
                Text("Troll Bridge Questionaire!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // Using the "message" state variable to update the message displayed to the user
                Text(message)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 0)
                    } label: {
                        // Using the "optionOne" state variable to update the option displayed to the user
                        Text(Q1)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 1)
                    } label: {
                        // Using the "optionTwo" state variable to update the option displayed to the user
                        Text(Q2)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }

                    Spacer()

                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        checkAnswer(a: 2)
                    } label: {
                        // Using the "optionThree" state variable to update the option displayed to the user
                        Text(Q3)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }

                    Spacer()
                    
                    Button {
                        checkAnswer(a: 3)
                    } label: {
                        // Using the "optionFour" state variable to update the option displayed to the user
                        Text(Q4)
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 150.0)
                            .fontWeight(.bold)
                    }

                    Spacer()

                }

                
                Spacer()
                
                Button {
                    nextQuestion()
                } label: {
                    // Using the "buttonText" state variable to update the text in the button displayed to the user
                    Text(buttonText)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                        .border(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/7/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
