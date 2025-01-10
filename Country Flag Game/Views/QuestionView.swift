//
//  QuestionView.swift
//  Country Flag Game
//
//  Created by Tyler Berlin on 1/8/25.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        VStack(spacing: 20){
            if gameManager.playingGame {
                HStack{
                    Text("Country Flag Game")
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                    Text("\(gameManager.index) out of \(gameManager.questions.count)")
                        .padding()
                }
                ProgressBar(progress: gameManager.progress)
                VStack(spacing: 10){
                    Text ("What country's flag is this?")
                        .font(.title)
                    Image(gameManager.country)
                        .resizable()
                        .frame(width: 300, height: 300)
                    ForEach(gameManager.answerChoices) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(gameManager)
                    }
                }
                Button {
                    gameManager.goToNextQuestion()
                } label: {
                    CustomButton(text: "Next", background: gameManager.answerSelected ? .yellow : .gray)
                }
                .disabled(!gameManager.answerSelected)
                Spacer()
            }
            else {
                Text("Country Flag Game")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("Congratulations! You have won the game!")
                Text("You scored \(gameManager.score) out of \(gameManager.questions.count)")
                Button{
                    gameManager.reset()
                } label: {
                    CustomButton(text: "Play Again")
                }
            }
        }
        .foregroundColor(.yellow)
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(.cyan)
        .navigationBarBackButtonHidden(true)
    }
}
    
    #Preview {
        QuestionView()
    }
