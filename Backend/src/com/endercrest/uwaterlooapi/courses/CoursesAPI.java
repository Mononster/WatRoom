package com.endercrest.uwaterlooapi.courses;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.courses.models.*;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 11/23/2016.
 */
public class CoursesAPI {

    private static final String COURSE_LIST_ENDPOINT = "courses";
    private static final String COURSE_SUBJECT_ENDPOINT = "courses/%s";
    private static final String COURSE_COURSE_ID_ENDPOINT = "courses/%s";
    private static final String COURSE_SCHEDULE_COURSE_NUMBER_ENDPOINT = "courses/%s/schedule";
    private static final String COURSE_SUBJECT_CATALOG_ENDPOINT = "courses/%s/%s";
    private static final String COURSE_SUBJECT_CATALOG_SCHEDULE_ENDPOINT = "courses/%s/%s/schedule";
    private static final String COURSE_SUBJECT_CATALOG_PREREQUISITE_ENDPOINT = "courses/%s/%s/prerequisite";
    private static final String COURSE_SUBJECT_CATALOG_EXAMSCHEDULE_ENDPOINT = "courses/%s/%s/examschedule";

    private final String apiKey;

    public CoursesAPI(String apiKey) {
        this.apiKey = apiKey;
    }

    /**
     * Retrieves all courses from "/courses"
     * @return Returns a list of more than 6000 courses.
     */
    public ApiRequest<List<CourseBase>> getAllCourses(){
        return ApiRequest.createApiRequest(COURSE_LIST_ENDPOINT, apiKey,
                new TypeToken<ApiRequest<List<CourseBase>>>() {}.getType());
    }

    /**
     * Retrieves all the courses with a specific subject from "/courses/{subject}
     * @param subject The string subject of the course.
     * @return List of Course's that all have the same subject.
     */
    public ApiRequest<List<Course>> getCourseBySubject(String subject){
        return ApiRequest.createApiRequest(String.format(COURSE_SUBJECT_ENDPOINT, subject), apiKey,
                new TypeToken<ApiRequest<List<Course>>>(){}.getType());
    }

    /**
     * Retrieve all specific information for a single course by retrieving it by its courseId
     * from "/courses/{courseId}
     * @param courseId The specific courseId
     * @return Contains all information of the specific course.
     */
    public ApiRequest<CourseFull> getCourseByCourseId(String courseId){
        return ApiRequest.createApiRequest(String.format(COURSE_COURSE_ID_ENDPOINT, courseId), apiKey,
                new TypeToken<ApiRequest<CourseFull>>(){}.getType());
    }

    /**
     * Retrieve the course schedule using the class number.
     * @param classNumber The class number for the specific schedule.
     * @return Contains a list of the classes schedule.
     */
    public ApiRequest<List<CourseSchedule>> getCourseScheduleByClassNumber(String classNumber){
        return ApiRequest.createApiRequest(String.format(COURSE_SCHEDULE_COURSE_NUMBER_ENDPOINT, classNumber), apiKey,
                new TypeToken<ApiRequest<List<CourseSchedule>>>(){}.getType());
    }

    /**
     * Retrieve the course schedule using the class number.
     * @param classNumber The class number for the specific schedule.
     * @param term Grab the schedule for a specific term.
     * @return Term specified course schedule.
     */
    public ApiRequest<List<CourseSchedule>> getCourseScheduleByClassNumber(String classNumber, String term){
        return ApiRequest.createApiRequest(String.format(COURSE_SCHEDULE_COURSE_NUMBER_ENDPOINT, classNumber), apiKey, "term="+term,
                new TypeToken<ApiRequest<List<CourseSchedule>>>(){}.getType());
    }

    /**
     * Retrieves a course information using the subject and catalog number from "course/{subject}/{catalogNumber}".
     * @param subject The course subject.
     * @param catalogNumber The course catalog Number
     * @return The full course information.
     */
    public ApiRequest<CourseFull> getCourseBySubjectCatalog(String subject, String catalogNumber){
        return ApiRequest.createApiRequest(String.format(COURSE_SUBJECT_CATALOG_ENDPOINT, subject, catalogNumber), apiKey,
                new TypeToken<ApiRequest<CourseFull>>(){}.getType());
    }

    /**
     * Retrieve a course schedule by using subject and catalog number from "course/{subject}/{catalogNumber}/schedule
     * @param subject The course subject
     * @param catalogNumber The course catalog Number
     * @return Contains a list of the classes schedule.
     */
    public ApiRequest<List<CourseSchedule>> getCourseScheduleBySubjectCatalog(String subject, String catalogNumber){
        return ApiRequest.createApiRequest(String.format(COURSE_SUBJECT_CATALOG_SCHEDULE_ENDPOINT, subject, catalogNumber), apiKey,
                new TypeToken<ApiRequest<List<CourseSchedule>>>(){}.getType());
    }

    /**
     * Retrieve a course schedule by using subject and catalog number from "course/{subject}/{catalogNumber}/schedule"
     * @param subject The course subject
     * @param catalogNumber The course catalog Number
     * @param term Grab the schedule for a specific term.
     * @return Term specified list of the classes schedule.
     */
    public ApiRequest<List<CourseSchedule>> getCourseScheduleBySubjectCatalog(String subject, String catalogNumber, String term){
        return ApiRequest.createApiRequest(String.format(COURSE_SUBJECT_CATALOG_SCHEDULE_ENDPOINT, subject, catalogNumber), apiKey, "term="+term,
                new TypeToken<ApiRequest<List<CourseSchedule>>>(){}.getType());
    }

    /**
     * Retrieves a course prerequisites by using subject and catalog number from "course/{subject}/{catalogNumber}/prerequisites".
     * @param subject The course subject
     * @param catalogNumber The course catalog Number
     * @return The courses specific prerequisites.
     */
    public ApiRequest<CoursePrerequisite> getCoursePrerequisiteBySubjectCatalog(String subject, String catalogNumber){
        return ApiRequest.createApiRequest(String.format(COURSE_SUBJECT_CATALOG_PREREQUISITE_ENDPOINT, subject, catalogNumber), apiKey,
                new TypeToken<ApiRequest<CoursePrerequisite>>(){}.getType());
    }

    /**
     * Retrieves a course exam schedule by using subject and catalog number from "course/{subject}/{catalogNunber}/examschedule"
     * @param subject The course subject.
     * @param catalogNumber The course catalog number
     * @return The courses exam schedule in the current term.
     */
    public ApiRequest<CourseExamSchedule> getCourseExamScheduleBySubjectCatalog(String subject, String catalogNumber){
        return ApiRequest.createApiRequest(String.format(COURSE_SUBJECT_CATALOG_EXAMSCHEDULE_ENDPOINT, subject, catalogNumber), apiKey,
                new TypeToken<ApiRequest<CourseExamSchedule>>(){}.getType());
    }


    /**
     * Retrieves a course exam schedule by using subject and catalog number from "course/{subject}/{catalogNunber}/examschedule"
     * @param subject The course subject.
     * @param catalogNumber The course catalog number
     * @param term Grab the exam schedule for the specific term
     * @return The courses exam schedule in the specified term.
     */
    public ApiRequest<CourseExamSchedule> getCourseExamScheduleBySubjectCatalog(String subject, String catalogNumber, String term){
        return ApiRequest.createApiRequest(String.format(COURSE_SUBJECT_CATALOG_EXAMSCHEDULE_ENDPOINT, subject, catalogNumber), apiKey, "term="+term,
                new TypeToken<ApiRequest<CourseExamSchedule>>(){}.getType());
    }

}
