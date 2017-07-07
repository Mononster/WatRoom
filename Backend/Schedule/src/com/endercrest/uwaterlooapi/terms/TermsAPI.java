package com.endercrest.uwaterlooapi.terms;

import com.endercrest.uwaterlooapi.data.ApiRequest;
import com.endercrest.uwaterlooapi.exceptions.NotImplementedException;
import com.endercrest.uwaterlooapi.terms.models.*;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 * Created by Thomas Cordua-von Specht on 12/2/2016.
 */
public class TermsAPI {

    private static final String TERM_LIST_ENDPOINT = "terms/list";
    private static final String TERM_COURSES_ENDPOINT = "terms/%s/courses";
    private static final String TERM_EXAMSCHEDULE_ENDPOINT = "terms/%s/examschedule";
    private static final String TERM_SUBJECT_SCHEDULE = "terms/%s/%s/schedule";
    private static final String TERM_SUBJECT_CATALOG_SCHEDULE = "terms/%s/%s/%s/schedule";
    private static final String TERM_ENROLLMENT_SCHEDULE = "terms/%s/enrollment";
    private static final String TERM_SUBJECT_ENROLLMENT_SCHEDULE = "terms/%s/%s/enrollment";
    private static final String TERM_INFOSESSIONS_SCHEDULE = "terms/%s/infosessions";

    private final String apiKey;

    public TermsAPI(String apiKey){
        this.apiKey = apiKey;
    }

    /**
     * Get the last years, current year, and next years list of terms.
     *
     * <p>
     * TODO Implement with custom deserializer
     * https://github.com/google/gson/blob/master/UserGuide.md#TOC-Custom-Serialization-and-Deserialization
     * </p>
     * @return Will throw {@link NotImplementedException}.
     *
     * @throws NotImplementedException This function is currently not ready for production use.
     */
    public ApiRequest<TermList> getList(){
        throw new NotImplementedException();
    }

    /**
     * Retrieves a list of all courses for a given term.
     * @param termId The Term id, ie "1161"
     * @return {@link TermCourse}
     */
    public ApiRequest<List<TermCourse>> getCourses(String termId){
        return ApiRequest.createApiRequest(String.format(TERM_COURSES_ENDPOINT, termId), apiKey,
                new TypeToken<ApiRequest<List<TermCourse>>>(){}.getType());
    }

    /**
     * Retrieve the examschedule for the specified term.
     * @param termId The term id, ie "1161"
     * @return {@link TermExamSchedule}
     */
    public ApiRequest<List<TermExamSchedule>> getExamSchedule(String termId){
        return ApiRequest.createApiRequest(String.format(TERM_EXAMSCHEDULE_ENDPOINT, termId), apiKey,
                new TypeToken<ApiRequest<List<TermExamSchedule>>>(){}.getType());
    }

    /**
     * Retrieve a list of a course schedules with the given term and subject.
     * @param termId The term id, ie "1161"
     * @param subject The subject, ie "MATH"
     * @return  {@link TermCourseSchedule}
     */
    public ApiRequest<List<TermCourseSchedule>> getCourseSchedules(String termId, String subject){
        return ApiRequest.createApiRequest(String.format(TERM_SUBJECT_SCHEDULE, termId, subject), apiKey,
                new TypeToken<ApiRequest<List<TermCourseSchedule>>>(){}.getType());
    }

    /**
     * Retrieve a list of a course schedules with the given term and subject and catalog number..
     * @param termId The term id, ie "1161"
     * @param subject The subject, ie "MATH"
     * @param catalogNumber The catalog number, ie "136"
     * @return  {@link TermCourseSchedule}
     */
    public ApiRequest<List<TermCourseSchedule>> getCouresSchedules(String termId, String subject, String catalogNumber){
        return ApiRequest.createApiRequest(String.format(TERM_SUBJECT_CATALOG_SCHEDULE, termId, subject, catalogNumber), apiKey,
                new TypeToken<ApiRequest<List<TermCourseSchedule>>>(){}.getType());
    }

    /**
     * Retrieve a list of enrollment numbers for all class for the specified term.
     * @param term The term id, ie "1161"
     * @return {@link TermCourseEnrollment}
     */
    public ApiRequest<List<TermCourseEnrollment>> getEnrollment(String term){
        return ApiRequest.createApiRequest(String.format(TERM_ENROLLMENT_SCHEDULE, term), apiKey,
                new TypeToken<ApiRequest<List<TermCourseEnrollment>>>(){}.getType());
    }

    /**
     * Retrieve a list of enrollment numbers for all class for the specified term.
     * @param term The term id, ie "1161"
     * @return {@link TermCourseEnrollment}
     */
    public ApiRequest<List<TermCourseEnrollment>> getEnrollment(String term, String subject){
        return ApiRequest.createApiRequest(String.format(TERM_SUBJECT_ENROLLMENT_SCHEDULE, term, subject), apiKey,
                new TypeToken<ApiRequest<List<TermCourseEnrollment>>>(){}.getType());
    }

    /**
     * Retrieve a list of employer information sessions for the given term.
     * @param term The term id, ie "1161"
     * @return {@link TermInfoSession}
     */
    public ApiRequest<List<TermInfoSession>> getInfoSessions(String term){
        return ApiRequest.createApiRequest(String.format(TERM_INFOSESSIONS_SCHEDULE, term), apiKey,
                new TypeToken<ApiRequest<List<TermInfoSession>>>(){}.getType());
    }
}
