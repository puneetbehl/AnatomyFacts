package co

import com.intelligrape.anatomyfacts.Question
import com.intelligrape.anatomyfacts.Option

class QuestionCO {
    Question question
    Option answer

    @Override
    public String toString() {
        return "QuestionCO{" +
                "id=" + id +
                ", answer=" + answer +
                '}';
    }
}
